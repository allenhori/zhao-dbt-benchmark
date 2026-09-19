select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 - p.v5 as v1,
    p.v5 * 13 as v2,
    p.v5 * 13 as v3,
    p.v5 + 13 as v4,
    coalesce(p.v5, 0) + 5 as v5,
    case when p.v4 > 300 then p.v4 else 0 end as v6,
    case when p.v5 > p.v4 then p.v5 else p.v4 end as v7
from {{ ref('int_ev_0013') }} as p
