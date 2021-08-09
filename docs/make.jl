using SimpleAiboWebAPI
using Documenter

DocMeta.setdocmeta!(SimpleAiboWebAPI, :DocTestSetup, :(using SimpleAiboWebAPI); recursive=true)

# The DOCSARGS environment variable can be used to pass additional arguments to make.jl.
# This is useful on CI, if you need to change the behavior of the build slightly but you
# can not change the .travis.yml or make.jl scripts any more (e.g. for a tag build).
if haskey(ENV, "DOCSARGS")
    for arg in split(ENV["DOCSARGS"])
        (arg in ARGS) || push!(ARGS, arg)
    end
end

makedocs(
    modules=[SimpleAiboWebAPI],
    authors="Hiroharu Sugawara <hsugawa@gmail.com>",
    repo="https://github.com/hsugawa8651/SimpleAiboWebAPI.jl/blob/{commit}{path}#{line}",
    sitename="SimpleAiboWebAPI.jl",
    format=Documenter.HTML(
        # Use clean URLs, unless built as a "local" build
        prettyurls = !("local" in ARGS),
        canonical="https://hsugawa8651.github.io/SimpleAiboWebAPI.jl/stable",
        assets=String[],
    ),
    clean=false,
    pages=[
        "Home" => "index.md",
        "Manual" => [
            "Usage" => "usage.md",
            "使い方" => "usageja.md"
        ],
        "Reference" => "reference.md"
    ],
)

deploydocs(
    repo="github.com/hsugawa8651/SimpleAiboWebAPI.jl",
)
