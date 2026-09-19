select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + 7 as v1,
    case when p.v1 > 200 then p.v1 else 0 end as v2,
    p.v7 + p.v1 as v3,
    p.v7 * 0.5 + p.v1 * 0.5 as v4,
    p.v7 + 7 as v5,
    coalesce(p.v7, 0) + 2 as v6
from {{ ref('int_ev_0010') }} as p
