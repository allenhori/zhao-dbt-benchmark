select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v1 + p.v7 as v1,
    p.v1 * 3 as v2,
    p.v1 - p.v6 as v3,
    coalesce(p.v6, 0) + 2 as v4,
    case when p.v6 > 700 then p.v6 else 0 end as v5,
    p.v7 + 11 as v6
from {{ ref('int_ev_0010') }} as p
