select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v2 > 1100 then p.v2 else 0 end as v1,
    coalesce(p.v2, 0) + 3 as v2,
    case when p.v2 > 300 then p.v2 else 0 end as v3,
    round(p.v2 / 2.0, 4) as v4,
    round(p.v2 / 3.0, 4) as v5,
    coalesce(p.v2, 0) + 7 as v6
from {{ ref('int_ev_0099') }} as p
where p.customer_id % 97 <> 0
