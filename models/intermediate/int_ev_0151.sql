select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 - p.v1 as v1,
    p.v1 + 13 as v2,
    case when p.v1 > p.v6 then p.v1 else p.v6 end as v3,
    case when p.v1 > p.v6 then p.v1 else p.v6 end as v4,
    case when p.v1 > p.v6 then p.v1 else p.v6 end as v5,
    p.v1 * 5 as v6,
    p.v6 + 13 as v7,
    case when p.v1 > 300 then p.v1 else 0 end as v8
from {{ ref('int_ev_0023') }} as p
