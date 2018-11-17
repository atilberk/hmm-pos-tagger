
function splitdata(filename="posdata.tsv", trainrate::Number=0.9)

    # read all token/POStag pairs into a list
    # with empty strings separating the sentences
    lines = readlines(filename);

    # convert into list of sentences
    S = foldLines(lines)[1:end-1];

    # shuffle the list of sentences
    shd = randperm(length(S));

    # split the sentences into train and test by 90/10
    separatrix = convert(Int, trunc(length(S)*trainrate))
    trainS = S[shd[1:separatrix]];
    testS = S[shd[separatrix+1:end]];

    # write them into file
    open(filename[1:end-4]*"_train.tsv","w") do f
       write(f, join(join.(trainS,"\n"),"\n\n") * "\n")
    end
    open(filename[1:end-4]*"_test.tsv","w") do f
       write(f, join(join.(testS,"\n"),"\n\n") * "\n")
    end

end

# returns a list of 2xL_i matrices where L_i is the length of ith sentence in the list
# the first row of the matrices is the tokens,
# the second row is the POS tags.
function readData(fn)
    lines = readlines("posdata_test.tsv");
    L = foldLines(lines)
    map(l->reduce(hcat,map(t->split(t,"\t"),l)),L)
end

# transform the array into a list of lists
# where each element of of outer list is one sentence
# which is in the form of an inner list of token/POStag pairs
foldLines(lines) = reduce(
               (d,l) -> isempty(l) ?
                        vcat(d,[[]]) :
                        vcat(d[1:end-1],[vcat(d[end],[l])]),
               [[]],
               lines
           )

# gets all of the tokens in a dataset
extactTokens(fn)=getindex.(split.(filter(s->!isempty(s), readlines(fn)),"\t"),1)

extractPOSTagset(fn="posdata.tsv") = Set(Symbol.(readdlm(fn)[:,2]))
# already extracted set from posdata!
POSLIST = sort(collect(Set([
    :Adj :Adv :Conj :Det :Dup :Interj :Noun
    :Num :Postp :Pron :Punc :Ques :Verb :Zero
])))

# extend Base.lowercase for handling I/İ -> ı/i confussion
trlowercase(s::AbstractString) = Base.lowercase(replace(s,"I","ı"))

# cascade of token preprocessing operations
normalise(s::AbstractString) = trlowercase(strip(s))


# this might come in handy!
etoi(collection, e) = findfirst(collection, e)
itoe(collection, i) = getindex(collection, i)
