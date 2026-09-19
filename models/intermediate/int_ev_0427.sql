select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > p.v5 then p.v6 else p.v5 end as v1,
    coalesce(p.v5, 0) + 2 as v2,
    case when p.v1 > 300 then p.v1 else 0 end as v3,
    p.v5 - p.v1 as v4,
    case when p.v1 > 1100 then p.v1 else 0 end as v5,
    round(p.v5 / 11.0, 4) as v6
from {{ ref('int_ev_0305') }} as p
where p.customer_id % 97 <> 0
