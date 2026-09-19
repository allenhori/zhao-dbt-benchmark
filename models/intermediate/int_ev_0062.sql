select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v3 / 13.0, 4) as v1,
    round(p.v8 / 5.0, 4) as v2,
    case when p.v8 > p.v3 then p.v8 else p.v3 end as v3,
    round(p.v8 / 11.0, 4) as v4,
    coalesce(p.v3, 0) + 7 as v5,
    coalesce(p.v8, 0) + 13 as v6
from {{ ref('int_ev_0023') }} as p
where p.customer_id % 97 <> 0
