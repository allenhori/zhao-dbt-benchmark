select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v1, 0) + 3 as v1,
    case when p.v1 > p.v5 then p.v1 else p.v5 end as v2,
    coalesce(p.v2, 0) + 13 as v3,
    p.v5 + p.v1 as v4,
    case when p.v5 > p.v1 then p.v5 else p.v1 end as v5,
    p.v1 - p.v5 as v6
from {{ ref('int_ev_0002') }} as p
