select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 * 0.5 + p.v7 * 0.5 as v1,
    p.v6 - p.v7 as v2,
    p.v6 * 7 as v3,
    case when p.v6 > p.v7 then p.v6 else p.v7 end as v4,
    p.v7 + 13 as v5,
    p.v6 * 7 as v6,
    p.v7 * 5 as v7,
    case when p.v7 > 500 then p.v7 else 0 end as v8
from {{ ref('int_ev_0119') }} as p
where p.customer_id % 97 <> 0
