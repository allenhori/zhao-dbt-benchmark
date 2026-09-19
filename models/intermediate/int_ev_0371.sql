select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v7 / 11.0, 4) as v1,
    round(p.v7 / 5.0, 4) as v2,
    case when p.v6 > 1100 then p.v6 else 0 end as v3,
    round(p.v3 / 3.0, 4) as v4,
    p.v6 - p.v3 as v5,
    p.v3 + 7 as v6
from {{ ref('int_ev_0000') }} as p
where p.customer_id % 97 <> 0
