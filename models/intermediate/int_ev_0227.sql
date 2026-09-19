select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 2 as v1,
    case when p.v4 > 300 then p.v4 else 0 end as v2,
    coalesce(p.v4, 0) + 5 as v3,
    case when p.v1 > 1100 then p.v1 else 0 end as v4,
    case when p.v1 > 1300 then p.v1 else 0 end as v5,
    case when p.v1 > 700 then p.v1 else 0 end as v6,
    case when p.v4 > p.v1 then p.v4 else p.v1 end as v7,
    coalesce(p.v2, 0) + 13 as v8
from {{ ref('int_ev_0026') }} as p
