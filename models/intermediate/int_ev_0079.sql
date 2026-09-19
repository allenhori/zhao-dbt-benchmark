select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v5 / 3.0, 4) as v1,
    case when p.v5 > p.v6 then p.v5 else p.v6 end as v2,
    case when p.v6 > 1100 then p.v6 else 0 end as v3,
    p.v6 * 0.5 + p.v5 * 0.5 as v4,
    p.v6 - p.v5 as v5,
    p.v6 * 5 as v6,
    case when p.v6 > p.v1 then p.v6 else p.v1 end as v7,
    case when p.v6 > 700 then p.v6 else 0 end as v8
from {{ ref('int_ev_0078') }} as p
where p.customer_id % 97 <> 0
