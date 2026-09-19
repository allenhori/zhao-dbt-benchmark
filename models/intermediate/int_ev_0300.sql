select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 * 7 as v1,
    coalesce(p.v7, 0) + 11 as v2,
    coalesce(p.v1, 0) + 11 as v3,
    p.v1 + 7 as v4,
    case when p.v1 > 1100 then p.v1 else 0 end as v5,
    p.v1 + p.v7 as v6
from {{ ref('int_ev_0288') }} as p
