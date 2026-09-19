select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 - p.v2 as v1,
    case when p.v3 > 200 then p.v3 else 0 end as v2,
    p.v1 - p.v3 as v3,
    round(p.v2 / 11.0, 4) as v4,
    p.v3 * 0.5 + p.v2 * 0.5 as v5,
    coalesce(p.v2, 0) + 3 as v6,
    coalesce(p.v2, 0) + 2 as v7,
    p.v3 * 0.5 + p.v2 * 0.5 as v8
from {{ ref('int_ev_0022') }} as p
