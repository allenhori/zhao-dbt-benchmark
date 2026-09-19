select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v3 * 2 as v1,
    p.v3 + p.v7 as v2,
    case when p.v7 > 1100 then p.v7 else 0 end as v3,
    case when p.v3 > 700 then p.v3 else 0 end as v4,
    p.v3 + 13 as v5,
    p.v3 - p.v7 as v6
from {{ ref('int_ev_0147') }} as p
