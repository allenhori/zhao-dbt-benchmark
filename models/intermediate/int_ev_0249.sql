select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 * 0.5 + p.v4 * 0.5 as v1,
    p.v5 * 0.5 + p.v6 * 0.5 as v2,
    case when p.v6 > 1100 then p.v6 else 0 end as v3,
    p.v5 * 2 as v4,
    round(p.v5 / 7.0, 4) as v5,
    case when p.v6 > 500 then p.v6 else 0 end as v6,
    case when p.v6 > 300 then p.v6 else 0 end as v7,
    case when p.v4 > p.v6 then p.v4 else p.v6 end as v8
from {{ ref('int_ev_0023') }} as p
where p.customer_id % 97 <> 0
