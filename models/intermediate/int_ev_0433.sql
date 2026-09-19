select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v8, 0) + 5 as v1,
    p.v5 * 0.5 + p.v4 * 0.5 as v2,
    case when p.v5 > p.v8 then p.v5 else p.v8 end as v3,
    coalesce(p.v8, 0) + 2 as v4,
    p.v5 + p.v8 as v5,
    p.v4 + 13 as v6,
    case when p.v5 > p.v4 then p.v5 else p.v4 end as v7,
    coalesce(p.v8, 0) + 5 as v8
from {{ ref('int_ev_0000') }} as p
