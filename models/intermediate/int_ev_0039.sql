select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v2 * 5 as v1,
    case when p.v6 > 200 then p.v6 else 0 end as v2,
    round(p.v5 / 2.0, 4) as v3,
    case when p.v2 > 700 then p.v2 else 0 end as v4,
    p.v6 - p.v5 as v5,
    case when p.v5 > 1100 then p.v5 else 0 end as v6,
    case when p.v2 > 200 then p.v2 else 0 end as v7,
    p.v5 + p.v2 as v8
from {{ ref('int_ev_0020') }} as p
where p.customer_id % 97 <> 0
