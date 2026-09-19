select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 * 13 as v1,
    round(p.v1 / 13.0, 4) as v2,
    coalesce(p.v7, 0) + 13 as v3,
    coalesce(p.v7, 0) + 3 as v4,
    p.v7 * 0.5 + p.v1 * 0.5 as v5,
    case when p.v1 > 700 then p.v1 else 0 end as v6,
    p.v1 - p.v7 as v7,
    round(p.v7 / 2.0, 4) as v8
from {{ ref('int_ev_0028') }} as p
