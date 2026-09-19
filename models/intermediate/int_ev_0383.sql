select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v1 / 7.0, 4) as v1,
    case when p.v7 > 200 then p.v7 else 0 end as v2,
    p.v1 - p.v3 as v3,
    p.v7 * 0.5 + p.v1 * 0.5 as v4,
    p.v3 * 0.5 + p.v7 * 0.5 as v5,
    p.v3 * 2 as v6,
    round(p.v3 / 13.0, 4) as v7
from {{ ref('int_ev_0016') }} as p
