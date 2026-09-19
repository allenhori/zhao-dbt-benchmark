select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 - p.v1 as v1,
    p.v1 + p.v7 as v2,
    p.v7 * 3 as v3,
    case when p.v7 > 300 then p.v7 else 0 end as v4,
    p.v1 * 5 as v5,
    p.v7 - p.v1 as v6,
    case when p.v7 > 700 then p.v7 else 0 end as v7
from {{ ref('int_ev_0147') }} as p
