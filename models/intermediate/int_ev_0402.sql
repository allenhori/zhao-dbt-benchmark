select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 * 11 as v1,
    case when p.v8 > p.v3 then p.v8 else p.v3 end as v2,
    round(p.v8 / 5.0, 4) as v3,
    round(p.v1 / 3.0, 4) as v4,
    case when p.v8 > 700 then p.v8 else 0 end as v5,
    p.v1 * 7 as v6,
    case when p.v3 > 1100 then p.v3 else 0 end as v7
from {{ ref('int_ev_0024') }} as p
where p.customer_id % 97 <> 0
