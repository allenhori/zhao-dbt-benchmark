select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v7 * 2 as v1,
    case when p.v7 > p.v3 then p.v7 else p.v3 end as v2,
    round(p.v3 / 3.0, 4) as v3,
    case when p.v3 > p.v6 then p.v3 else p.v6 end as v4,
    p.v3 + p.v6 as v5,
    p.v6 + 3 as v6,
    round(p.v7 / 11.0, 4) as v7
from {{ ref('int_ev_0000') }} as p
where p.customer_id % 97 <> 0
