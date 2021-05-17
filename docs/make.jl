using SimpleAiboWebAPI
using Documenter

DocMeta.setdocmeta!(SimpleAiboWebAPI, :DocTestSetup, :(using SimpleAiboWebAPI); recursive=true)

makedocs(;
    modules=[SimpleAiboWebAPI],
    authors="Hiroharu Sugawara <hsugawa@gmail.com>",
    repo="https://github.com/hsugawa8651/SimpleAiboWebAPI.jl/blob/{commit}{path}#{line}",
    sitename="SimpleAiboWebAPI.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://hsugawa8651.github.io/SimpleAiboWebAPI.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
        "Manual" => [
            "Usage" => "usage.md",
            "使い方" => "usageja.md"
        ],
        "Reference" => "reference.md"
    ],
)

deploydocs(;
    repo="github.com/hsugawa8651/SimpleAiboWebAPI.jl",
)
