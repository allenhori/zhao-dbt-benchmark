select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > 200 then p.v6 else 0 end as v1,
    case when p.v6 > 200 then p.v6 else 0 end as v2,
    round(p.v4 / 3.0, 4) as v3,
    round(p.v2 / 11.0, 4) as v4,
    case when p.v4 > 1100 then p.v4 else 0 end as v5,
    p.v2 + 13 as v6,
    p.v2 + p.v6 as v7,
    p.v4 + p.v2 as v8
from {{ ref('int_ev_0029') }} as p
where p.customer_id % 97 <> 0
