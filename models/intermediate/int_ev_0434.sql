select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 2 as v1,
    p.v3 + 3 as v2,
    case when p.v3 > p.v2 then p.v3 else p.v2 end as v3,
    round(p.v2 / 13.0, 4) as v4,
    p.v2 + 5 as v5,
    p.v3 * 3 as v6,
    p.v2 * 0.5 + p.v5 * 0.5 as v7,
    p.v2 * 13 as v8
from {{ ref('int_ev_0326') }} as p
