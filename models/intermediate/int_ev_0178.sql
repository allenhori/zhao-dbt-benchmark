select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v1 > 700 then p.v1 else 0 end as v1,
    p.v5 * 13 as v2,
    case when p.v1 > p.v5 then p.v1 else p.v5 end as v3,
    round(p.v4 / 5.0, 4) as v4,
    p.v1 * 2 as v5,
    p.v5 * 5 as v6,
    p.v5 + 5 as v7,
    p.v4 + 7 as v8
from {{ ref('int_ev_0065') }} as p
where p.customer_id % 97 <> 0
