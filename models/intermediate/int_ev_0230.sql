select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    coalesce(p.v2, 0) + 11 as v1,
    p.v2 + 11 as v2,
    p.v6 * 2 as v3,
    p.v5 * 3 as v4,
    coalesce(p.v6, 0) + 3 as v5,
    case when p.v6 > p.v5 then p.v6 else p.v5 end as v6
from {{ ref('int_ev_0037') }} as p
