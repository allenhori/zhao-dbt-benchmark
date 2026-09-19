select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v4 + 2 as v1,
    p.v5 - p.v4 as v2,
    p.v4 * 3 as v3,
    p.v4 * 2 as v4,
    case when p.v4 > 200 then p.v4 else 0 end as v5,
    case when p.v4 > 200 then p.v4 else 0 end as v6,
    p.v5 - p.v4 as v7
from {{ ref('int_ev_0001') }} as p
where p.customer_id % 97 <> 0
