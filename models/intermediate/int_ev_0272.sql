select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 + 11 as v1,
    case when p.v4 > p.v2 then p.v4 else p.v2 end as v2,
    round(p.v4 / 2.0, 4) as v3,
    p.v2 + 3 as v4,
    p.v2 * 0.5 + p.v4 * 0.5 as v5,
    p.v2 + 2 as v6,
    p.v2 * 7 as v7
from {{ ref('int_ev_0167') }} as p
