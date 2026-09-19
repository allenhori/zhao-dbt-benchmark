select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + 3 as v1,
    coalesce(p.v2, 0) + 3 as v2,
    p.v2 + 2 as v3,
    p.v1 * 5 as v4,
    p.v1 - p.v2 as v5,
    round(p.v1 / 3.0, 4) as v6,
    case when p.v2 > 1300 then p.v2 else 0 end as v7,
    p.v2 * 7 as v8
from {{ ref('int_ev_0016') }} as p
