select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 - p.v2 as v1,
    p.v7 * 3 as v2,
    round(p.v2 / 5.0, 4) as v3,
    p.v7 + 11 as v4,
    round(p.v7 / 11.0, 4) as v5,
    case when p.v7 > p.v2 then p.v7 else p.v2 end as v6,
    p.v7 * 13 as v7,
    p.v2 + 2 as v8
from {{ ref('int_ev_0009') }} as p
