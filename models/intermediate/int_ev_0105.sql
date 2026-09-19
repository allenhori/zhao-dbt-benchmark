select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v4 > 1100 then p.v4 else 0 end as v1,
    p.v4 - p.v2 as v2,
    p.v2 * 7 as v3,
    round(p.v2 / 13.0, 4) as v4,
    p.v2 * 0.5 + p.v4 * 0.5 as v5,
    p.v3 * 3 as v6,
    p.v4 + 5 as v7
from {{ ref('int_ev_0016') }} as p
