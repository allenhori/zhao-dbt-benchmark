select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 * 3 as v1,
    round(p.v6 / 5.0, 4) as v2,
    case when p.v1 > 1100 then p.v1 else 0 end as v3,
    case when p.v6 > 200 then p.v6 else 0 end as v4,
    p.v6 * 7 as v5,
    case when p.v6 > 200 then p.v6 else 0 end as v6
from {{ ref('int_ev_0016') }} as p
where p.customer_id % 97 <> 0
