select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 * 0.5 + p.v7 * 0.5 as v1,
    case when p.v7 > 1100 then p.v7 else 0 end as v2,
    p.v8 + 13 as v3,
    round(p.v7 / 13.0, 4) as v4,
    p.v7 * 7 as v5,
    p.v8 + p.v7 as v6
from {{ ref('int_ev_0001') }} as p
