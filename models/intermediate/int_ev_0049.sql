select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 - p.v5 as v1,
    p.v7 - p.v1 as v2,
    case when p.v7 > 1300 then p.v7 else 0 end as v3,
    case when p.v5 > 500 then p.v5 else 0 end as v4,
    coalesce(p.v5, 0) + 5 as v5,
    p.v7 + p.v5 as v6,
    coalesce(p.v1, 0) + 5 as v7,
    p.v1 + 2 as v8
from {{ ref('int_ev_0024') }} as p
