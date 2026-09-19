select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    round(p.v5 / 5.0, 4) as v1,
    case when p.v2 > p.v5 then p.v2 else p.v5 end as v2,
    round(p.v5 / 5.0, 4) as v3,
    p.v5 + 11 as v4,
    p.v2 + 5 as v5,
    round(p.v5 / 7.0, 4) as v6,
    round(p.v2 / 7.0, 4) as v7
from {{ ref('int_ev_0195') }} as p
where p.customer_id % 97 <> 0
