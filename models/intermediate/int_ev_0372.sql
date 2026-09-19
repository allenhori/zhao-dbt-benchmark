select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    p.v6 - p.v1 as v1,
    p.v3 + 2 as v2,
    p.v6 * 11 as v3,
    p.v3 + 11 as v4,
    case when p.v3 > p.v1 then p.v3 else p.v1 end as v5,
    p.v3 + p.v6 as v6
from {{ ref('int_ev_0297') }} as p
where p.customer_id % 97 <> 0
