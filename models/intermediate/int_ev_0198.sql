select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + 11 as v1,
    p.v5 + 2 as v2,
    p.v5 + 7 as v3,
    p.v2 * 5 as v4,
    case when p.v5 > p.v2 then p.v5 else p.v2 end as v5,
    p.v5 * 11 as v6,
    case when p.v2 > 200 then p.v2 else 0 end as v7,
    round(p.v5 / 13.0, 4) as v8
from {{ ref('int_ev_0160') }} as p
where p.customer_id % 97 <> 0
