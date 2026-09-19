select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v5 + p.v6 as v1,
    p.v5 * 0.5 + p.v4 * 0.5 as v2,
    coalesce(p.v6, 0) + 5 as v3,
    p.v4 * 11 as v4,
    case when p.v4 > 300 then p.v4 else 0 end as v5,
    p.v6 + p.v4 as v6,
    case when p.v5 > p.v6 then p.v5 else p.v6 end as v7
from {{ ref('int_ev_0141') }} as p
where p.customer_id % 97 <> 0
