select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + 13 as v1,
    p.v3 - p.v1 as v2,
    round(p.v1 / 5.0, 4) as v3,
    case when p.v5 > 1100 then p.v5 else 0 end as v4,
    coalesce(p.v5, 0) + 13 as v5,
    p.v3 * 11 as v6,
    p.v1 * 11 as v7,
    case when p.v5 > 1100 then p.v5 else 0 end as v8
from {{ ref('int_ev_0026') }} as p
