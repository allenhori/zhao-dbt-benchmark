select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v3 > 1300 then p.v3 else 0 end as v1,
    case when p.v4 > 1100 then p.v4 else 0 end as v2,
    case when p.v4 > 300 then p.v4 else 0 end as v3,
    case when p.v6 > p.v3 then p.v6 else p.v3 end as v4,
    p.v6 * 3 as v5,
    case when p.v6 > 200 then p.v6 else 0 end as v6,
    case when p.v3 > p.v6 then p.v3 else p.v6 end as v7,
    round(p.v3 / 3.0, 4) as v8
from {{ ref('int_ev_0112') }} as p
where p.customer_id % 97 <> 0
