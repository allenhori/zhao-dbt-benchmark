select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 * 0.5 + p.v5 * 0.5 as v1,
    case when p.v4 > 1300 then p.v4 else 0 end as v2,
    case when p.v5 > 500 then p.v5 else 0 end as v3,
    p.v5 + 13 as v4,
    case when p.v5 > p.v8 then p.v5 else p.v8 end as v5,
    coalesce(p.v5, 0) + 5 as v6,
    case when p.v4 > 500 then p.v4 else 0 end as v7,
    coalesce(p.v8, 0) + 5 as v8
from {{ ref('int_ev_0002') }} as p
