require "apache2"

--[[
    Dumps all the published links
--]]
function dump_files(t, r, dir)
	for _, f in ipairs(r:get_direntries(dir)) do
        if f ~= "." and f ~= ".." then
            local filepath = dir .. "/" .. f
            local info = r:stat(filepath)
            if info then
                -- if this is a file, then add it to the table!
                if info.filetype == 1 then
                    t[filepath] = info
                end

                -- if this is a dir, then descend into it
                if info.filetype == 2 then
                    dump_files(t, r, filepath)
                end
            end
        end
	end
end

function handle(r)
    r.content_type = "text/plain"

    if r.method == 'GET' then
        local links = {}
        dump_files(links, r, r.document_root)

        for filepath, info in pairs(links) do
            r:puts( ("%s\n"):format(
                filepath:gsub(r.document_root, r.server_name .. ":" ..r.port)
            ))
        end
    else
        return 501
    end
    return apache2.OK
end
