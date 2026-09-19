select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v8 - p.v6 as v1,
    p.v6 * 5 as v2,
    case when p.v8 > p.v6 then p.v8 else p.v6 end as v3,
    case when p.v8 > 700 then p.v8 else 0 end as v4,
    p.v8 * 0.5 + p.v6 * 0.5 as v5,
    round(p.v6 / 13.0, 4) as v6,
    p.v8 * 5 as v7
from {{ ref('int_ev_0001') }} as p
where p.customer_id % 97 <> 0
