select
    p.event_id as event_id,
    p.customer_id as customer_id,
    p.segment_id as segment_id,
    case when p.v6 > 1300 then p.v6 else 0 end as v1,
    round(p.v6 / 13.0, 4) as v2,
    p.v6 + 3 as v3,
    p.v6 - p.v4 as v4,
    p.v6 + 13 as v5,
    round(p.v6 / 7.0, 4) as v6
from {{ ref('int_ev_0013') }} as p
