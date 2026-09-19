select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 11 as v1,
    case when p.v3 > 300 then p.v3 else 0 end as v2,
    case when p.v1 > p.v3 then p.v1 else p.v3 end as v3,
    case when p.v1 > 1100 then p.v1 else 0 end as v4,
    p.v5 * 5 as v5,
    case when p.v3 > 700 then p.v3 else 0 end as v6,
    p.v1 * 11 as v7
from {{ ref('int_ev_0029') }} as p
