select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 - p.v3 as v1,
    p.v3 + 3 as v2,
    case when p.v3 > 700 then p.v3 else 0 end as v3,
    p.v3 * 7 as v4,
    round(p.v2 / 7.0, 4) as v5,
    p.v2 * 0.5 + p.v3 * 0.5 as v6,
    round(p.v4 / 5.0, 4) as v7,
    round(p.v3 / 2.0, 4) as v8
from {{ ref('int_ev_0004') }} as p
