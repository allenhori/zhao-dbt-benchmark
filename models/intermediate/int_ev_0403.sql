select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v5, 0) + 11 as v1,
    p.v5 * 13 as v2,
    case when p.v5 > p.v1 then p.v5 else p.v1 end as v3,
    p.v5 * 11 as v4,
    p.v1 + 11 as v5,
    p.v1 + 2 as v6
from {{ ref('int_ev_0010') }} as p
