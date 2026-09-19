select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 - p.v2 as v1,
    p.v4 * 2 as v2,
    p.v2 * 13 as v3,
    p.v3 * 7 as v4,
    case when p.v3 > 1300 then p.v3 else 0 end as v5,
    p.v2 * 13 as v6,
    coalesce(p.v4, 0) + 5 as v7
from {{ ref('int_ev_0010') }} as p
