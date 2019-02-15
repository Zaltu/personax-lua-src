local rankup = {}

function rankup.refresh()
    state.update = json.encode({
        key="link.rankup",
        text=rankup.cut[rankup.open]
    })
end

function rankup.processinput()
    rankup.open = rankup.open + 1
    if rankup.cut[rankup.open] then
        --If there is another string to display in the rank up scene, do so.
        rankup.refresh()
    else
        --Else revert back to the social link mode.
        rankup.revert()
    end
end

function rankup.hijack()
    rankup.jackedprocessinput = state.context.processinput
    rankup.jackedindex = state.cut.index
    state.context.processinput = rankup.processinput

    --Set he rankup current open index to the 0, since we
    --increment it in local processinput to be able to reset
    --and return to the proper cutscene on completion
    rankup.open = 0

    --Load appropriate rank up text with dofile
    --dofile ensures that the added lua linkname/rank/etc
    --parsing in the marker files is reprocessed every time
    --for each link so it always shows the one from the
    --current context
    if state.context.rank ~= 10 then
        --Load normal level up marker
        rankup.cut = dofile(DATAPATH.."links/rank_up_normal.lua")
    else
        --Load max rank up marker
        rankup.cut = dofile(DATAPATH.."links/rank_up_max.lua")
    end
    rankup.processinput()
end

function rankup.revert()
    state.context.processinput = rankup.jackedprocessinput
    state.context.index = rankup.jackedindex
    --Make sure we don't fall into a loop when we return to the calling link
    state.cut.open.rankup = false
    state.context.processinput()
end

return rankup