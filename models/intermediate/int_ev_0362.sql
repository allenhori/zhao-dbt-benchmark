select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v4, 0) + 2 as v1,
    case when p.v4 > p.v3 then p.v4 else p.v3 end as v2,
    p.v5 * 5 as v3,
    case when p.v3 > p.v5 then p.v3 else p.v5 end as v4,
    p.v5 * 0.5 + p.v4 * 0.5 as v5,
    case when p.v3 > p.v4 then p.v3 else p.v4 end as v6,
    coalesce(p.v4, 0) + 7 as v7,
    coalesce(p.v5, 0) + 13 as v8
from {{ ref('int_ev_0280') }} as p
