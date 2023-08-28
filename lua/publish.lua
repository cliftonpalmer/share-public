require "apache2"

function publish(dir, pattern)
    local cmd = ("%s/publish.sh %s"):format(dir, pattern)
    local handle = io.popen(cmd)
    local output = handle:read('*a')
    handle:close()

    return output
end

function get_form(dir)
    local handle = io.open(dir .. '/submit.html')
    local output = handle:read('*a')
    handle:close()

    return output;
end

function handle(r)
    r.content_type = "text/html"

    local args = r:parseargs()
    local pattern = args.pattern 

    if pattern then
        local nonce = publish(r.context_document_root, pattern)

        -- if FQDN override is set,
        -- use override instead of my own server name and port number
        local fqdn = os.getenv('PUBLIC_FQDN_OVERRIDE')
        fqdn = fqdn or (r.is_https and "https" or "http") .. "://" .. r.server_name .. ":" ..r.port

        local uri = ("%s/%s/"):format(fqdn, nonce)
        r:puts( ([[<a href="%s">%s</a>]]):format(uri, uri) )
    else
        local template = get_form(r.context_document_root)
        r:puts( template )
    end

    return apache2.OK
end
