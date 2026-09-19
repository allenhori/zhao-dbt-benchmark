select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v5 > 200 then p.v5 else 0 end as v1,
    coalesce(p.v5, 0) + 13 as v2,
    case when p.v4 > 500 then p.v4 else 0 end as v3,
    round(p.v4 / 3.0, 4) as v4,
    round(p.v4 / 13.0, 4) as v5,
    round(p.v4 / 3.0, 4) as v6,
    round(p.v4 / 11.0, 4) as v7
from {{ ref('int_ev_0004') }} as p
where p.customer_id % 97 <> 0
